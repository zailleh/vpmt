document.addEventListener('DOMContentLoaded', () => {
  const sideMenu = document.querySelector('nav > ul');
  const menuItems = new Array(...sideMenu.children);
  menuItems.forEach((li) => {
    li.addEventListener('click', (e) => {
      menuItems.forEach((li) => li.classList.remove('active'));
      e.currentTarget.classList.add('active');
    })
  })
})