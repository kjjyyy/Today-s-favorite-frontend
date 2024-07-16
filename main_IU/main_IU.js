document.addEventListener("DOMContentLoaded", function () {
  // Calendar 관련 요소와 초기화
  const daysContainer = document.getElementById("days");
  const monthYear = document.getElementById("monthYear");
  const prevMonthButton = document.getElementById("prevMonth");
  const nextMonthButton = document.getElementById("nextMonth");
  const titleElement = document.querySelector(".title");

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
      dayDiv.classList.add("day");
      dayDiv.addEventListener("click", () => {
        const selectedDate = `${year}년 ${month + 1}월 ${i}일의`;
        titleElement.innerHTML = `<span class="memory">${selectedDate}<br>&nbsp&nbsp</span><span class="I">I</span><span class="U">U</span>`;
      });
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

  // Like icons 관련 초기화
  const likeIcons = document.querySelectorAll(".like-icon");
  likeIcons.forEach((icon) => {
    icon.addEventListener("click", () => {
      const likeCountSpan = icon.nextElementSibling;
      let likeCount = parseInt(likeCountSpan.textContent);
      likeCount += 1;
      likeCountSpan.textContent = likeCount;
    });
  });

  // 현재 날짜 설정 관련 초기화
  const currentDateElements = document.querySelectorAll(".date-text_1");
  const year = currentDate.getFullYear();
  const month = currentDate.getMonth() + 1;
  const day = currentDate.getDate();
  const formattedDate = `${year}년 ${month}월 ${day}일`;

  currentDateElements.forEach((element) => {
    element.textContent = formattedDate;
  });

  // 현재 날짜 설정 관련 초기화
  const currentDateElements2 = document.querySelectorAll(".date-text_2");
  const currentDate2 = new Date();
  const month2 = currentDate2.getMonth() + 1;
  const day2 = currentDate2.getDate();

  currentDateElements2.forEach((element) => {
    // 기존 텍스트에서 년도 추출
    const text = element.textContent;
    const yearMatch = text.match(/(\d{4})년/); // "20NN년"에서 "20NN" 추출
    const year2 = yearMatch ? yearMatch[1] : "20NN"; // 추출된 년도가 없으면 기본값 설정

    // 새로운 날짜 형식으로 업데이트
    const formattedDate2 = `${year2}년 ${month2}월 ${day2}일`;
    element.textContent = formattedDate2;
  });
});
