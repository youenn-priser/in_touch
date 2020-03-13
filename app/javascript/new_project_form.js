const show_client_form = () => {
  const add_client_button = document.querySelector('.btn-show');

  const client_form = document.querySelector('.client-form');

  const hide_and_show = () =>  {
    client_form.classList.toggle("d-none");
  }

  add_client_button.addEventListener('click', (event) => {
    hide_and_show();
  } );
};


export { show_client_form }
