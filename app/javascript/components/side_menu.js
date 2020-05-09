const sideMenu = () => {
  const burgerMenu = document.getElementById('burger-menu');
  const sideMenu = document.querySelector('.side-menu');
  const darkSideNav = document.querySelector('.sidenav-overlay');
  const body = document.querySelector('body');


  if (burgerMenu) {
    burgerMenu.addEventListener('click', (e) => {
      sideMenu.classList.toggle('large')
      body.classList.toggle('stop-scrolling')
      darkSideNav.classList.toggle('hidden')
      });
    } ;
}


export { sideMenu };
