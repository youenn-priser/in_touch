const activeUsCards = () => {

  const done_card = document.querySelectorAll('.done')
    done_card.forEach((card) => {
      card.addEventListener('click', (event) => {
        card.classList.toggle('done-active');
      })
    })

  const in_progress_card = document.querySelectorAll('.in-progress')
    in_progress_card.forEach((card) => {
      card.addEventListener('click', (event) => {
        card.classList.toggle('inprogress-active');
      })
    })
  const to_do_card = document.querySelectorAll('.to-do')
    to_do_card.forEach((card) => {
      card.addEventListener('click', (event) => {
        card.classList.toggle('to-do-active');
      })
    })
}

export { activeUsCards }
