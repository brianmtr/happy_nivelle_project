//Custom js for X menu burger

// function myFunction(x) {
//     x.classList.toggle("change");
//     }

    let hamButton = document.querySelector('.ham');
    let navBar = document.querySelector('.nav-ham');
    hamButton.addEventListener('click', openMenu);function openMenu(){
       
        navBar.classList.toggle('showNav');
        hamButton.classList.toggle('showClose');
      }
      let menuLinks = document.querySelectorAll('.menuLink');
      menuLinks.forEach(
        function(menuLink){
          menuLink.addEventListener('click', openMenu);
      
        }
      )