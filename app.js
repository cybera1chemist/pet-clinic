const pages = {
  pets: {
    dataUrl: "data/pets.json",
    tableId: "pet-table-body",
    fields: ["Name", "Age", "Gender", "Species"],
  },
  doctors: {
    dataUrl: "data/doctors.json",
    tableId: "doctor-table-body",
    fields: ["Name", "Department", "StaffID"],
  },
};

let allData = {
  pets: [],
  doctors: [],
};

document.addEventListener("DOMContentLoaded", async () => {
  try {
    for (const pageId in pages) {
      const response = await fetch(pages[pageId].dataUrl);
      if (!response.ok) throw new Error(`无法加载 ${pageId} 数据`);
      allData[pageId] = await response.json();
      console.log(`${pageId} 数据加载成功:`, allData[pageId]); // 调试日志
    }
    showPage("pets");
  } catch (error) {
    console.error("初始化失败:", error);
  }
});

function showPage(pageId) {
  document.querySelectorAll(".nav-btn").forEach((btn) => {
    btn.classList.toggle(
      "active",
      btn.onclick.toString().includes(`'${pageId}'`)
    );
  });

  document.querySelectorAll(".page").forEach((page) => {
    page.classList.toggle("active-page", page.id === `${pageId}-page`);
  });

  renderTable(pageId);
}

function renderTable(pageId) {
  const config = pages[pageId];
  const tbody = document.getElementById(config.tableId);
  if (!tbody) {
    console.error(`找不到表格容器: ${config.tableId}`);
    return;
  }
  tbody.innerHTML = "";

  allData[pageId].forEach((item) => {
    const row = document.createElement("tr");
    config.fields.forEach((field) => {
      const cell = document.createElement("td");
      cell.textContent = item[field] ?? "N/A";
      row.appendChild(cell);
    });
    tbody.appendChild(row);
  });
}

function filterTable(pageId) {
  const searchText = document
    .getElementById(`${pageId}Search`)
    .value.toLowerCase();
  const filteredData = allData[pageId].filter((item) => {
    return Object.values(item).some((val) => {
      return String(val).toLowerCase().includes(searchText);
    });
  });

  const config = pages[pageId];
  const tbody = document.getElementById(config.tableId);
  tbody.innerHTML = "";
  filteredData.forEach((item) => {
    const row = document.createElement("tr");
    config.fields.forEach((field) => {
      const cell = document.createElement("td");
      cell.textContent = item[field];
      row.appendChild(cell);
    });
    tbody.appendChild(row);
  });
}
