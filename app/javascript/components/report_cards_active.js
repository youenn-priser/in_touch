const activeReportCards = () => {
  const reportCards = document.querySelectorAll('.report-card');
  reportCards.forEach((card) => {
    card.addEventListener('click', (event) => {
      card.classList.toggle('report-card-active');
    })
  });
}

export { activeReportCards };
