document.addEventListener('DOMContentLoaded', function() {
    const currentDateElements = document.querySelectorAll('.date-text');
    const currentDate = new Date();
    const year = currentDate.getFullYear();
    const month = currentDate.getMonth() + 1; 
    const day = currentDate.getDate();
    const formattedDate = `${year}년 ${month}월 ${day}일`;

    currentDateElements.forEach(element => {
        element.textContent = formattedDate;
    });
});
