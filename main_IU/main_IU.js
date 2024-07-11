document.addEventListener("DOMContentLoaded", function () {
  const daysContainer = document.getElementById("days");
  const monthYear = document.getElementById("monthYear");
  const prevMonthButton = document.getElementById("prevMonth");
  const nextMonthButton = document.getElementById("nextMonth");

  let currentDate = new Date();

  function renderCalendar(date) {
    const year = date.getFullYear();
    const month = date.getMonth();
    const firstDay = new Date(year, month, 1).getDay();
    const lastDate = new Date(year, month + 1, 0).getDate();

    monthYear.textContent = `${year}년 ${month + 1}월`;

    daysContainer.innerHTML = "";

    for (let i = 0; i < firstDay; i++) {
      const emptyDiv = document.createElement("div");
      daysContainer.appendChild(emptyDiv);
    }

    for (let i = 1; i <= lastDate; i++) {
      const dayDiv = document.createElement("div");
      dayDiv.textContent = i;
      daysContainer.appendChild(dayDiv);
    }
  }

  prevMonthButton.addEventListener("click", function () {
    currentDate.setMonth(currentDate.getMonth() - 1);
    renderCalendar(currentDate);
  });

  nextMonthButton.addEventListener("click", function () {
    currentDate.setMonth(currentDate.getMonth() + 1);
    renderCalendar(currentDate);
  });

  renderCalendar(currentDate);
});

document.addEventListener("DOMContentLoaded", () => {
  const likeIcons = document.querySelectorAll(".like-icon");
  likeIcons.forEach((icon) => {
    icon.addEventListener("click", () => {
      const likeCountSpan = icon.nextElementSibling;
      let likeCount = parseInt(likeCountSpan.textContent);
      likeCount += 1;
      likeCountSpan.textContent = likeCount;
    });
  });
});
