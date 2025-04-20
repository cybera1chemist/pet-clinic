import re
import json
import argparse
from pathlib import Path

def parse_sql_inserts(sql_content):
    insert_pattern = re.compile(
        r"INSERT\s+INTO\s+(?P<table>\w+)\s*\((?P<columns>[^)]+)\)\s*VALUES\s*(?P<values>.*?);",
        re.IGNORECASE | re.DOTALL
    )
    
    matches = insert_pattern.findall(sql_content)
    if not matches:
        raise ValueError("未找到有效的 INSERT 语句")

    data = []
    for match in matches:
        table_name, columns_str, values_str = match
        columns = [col.strip() for col in columns_str.split(",")]
        
        values_str = re.sub(r"\s+", " ", values_str).strip()
        
        raw_records = re.findall(r"\(([^)]+)\)", values_str)
        
        for record in raw_records:
            raw_values = [v.strip() for v in re.split(r",(?=(?:[^']*'[^']*')*[^']*$)", record)]
            parsed_values = []
            for val in raw_values:
                if val.lower() == "null":
                    parsed_values.append(None)
                elif val.startswith("'") and val.endswith("'"):
                    parsed_values.append(val[1:-1].replace("''", "'"))
                elif val.isdigit():
                    parsed_values.append(int(val))
                else:
                    try:
                        parsed_values.append(float(val))
                    except:
                        parsed_values.append(val)
            data.append(dict(zip(columns, parsed_values)))
    
    return data

def main():
    parser = argparse.ArgumentParser(description="将 SQL INSERT 语句转换为 JSON")
    parser.add_argument("input", help="输入的 SQL 文件路径")
    parser.add_argument("-o", "--output", help="输出的 JSON 文件路径（默认同输入文件名）")
    args = parser.parse_args()

    input_path = Path(args.input)
    if not input_path.exists():
        raise FileNotFoundError(f"输入文件不存在: {input_path}")

    with open(input_path, "r", encoding="utf-8") as f:
        sql_content = f.read()

    try:
        data = parse_sql_inserts(sql_content)
    except Exception as e:
        print(f"解析失败: {str(e)}")
        return

    output_path = Path(args.output) if args.output else input_path.with_suffix(".json")
    dir_path = Path(r"./json/")
    output_path = dir_path / output_path.name
    output_path.parent.mkdir(parents=True, exist_ok=True)

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
    
    print(f"转换完成！共转换 {len(data)} 条记录 -> {output_path}")

if __name__ == "__main__":
    main()