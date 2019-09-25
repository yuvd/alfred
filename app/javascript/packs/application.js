import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

initMapbox();
initAutocomplete();

import { initStarRating } from '../plugins/init_star_rating';

initStarRating();

import "../plugins/flatpickr"


$(document).ready(function(){
  $(".form-check label").click(function(){
    console.log($(this));
    $(this).toggleClass("active");
  });

// $('.carousel-control-prev').click(function(){
//   $(this).toggleClass('d-none');
// });
// $(window).load(function(){
//     $(".col-3 input").val("");

//     $(".input-effect input").focusout(function(){
//       if($(this).val() != ""){
//         $(this).addClass("has-content");
//       }else{
//         $(this).removeClass("has-content");
//       }
//     })
//   });

// $('.card-category').click(function(){
//   $(this).toggleClass('expanded');
// });

// $('.card-category-profile').click(function(){
//   $(this).toggleClass('expanded-profile');
// });



const toggleInfo = event => {
  console.log(event)
  event.currentTarget.classList.toggle('new-expanded');
  document.querySelector(".next").classList.toggle("d-none");
  document.querySelector(".previous").classList.toggle("d-none")

}

const cardCat = document.querySelectorAll('.card-category');
cardCat.forEach(card => card.addEventListener('click', toggleInfo))




$('.card-category-review').click(function(){
  $(this).toggleClass('expanded-review');
});

$('.card-category-profile').click(function(){
  $(this).toggleClass('expanded-profile');
});



// const card = document.querySelector('.slider2')
// $('.slider2').click(function(){
//   $('.places-intro').toggleClass('d-none');
// });


  // const checks = document.querySelectorAll('.form-check');

  // function toggleActive(event){
  //   // event.currentTarget.classList.('active')
  //   event.currentTarget.classList.toggle('active');
  // }
  // checks.forEach(check => check.addEventListener('click', toggleActive))
});




const init = function(){
    let items = document.querySelectorAll('section');
    for (let i = 0; i < items.length; i++){
        items[i].style.background = randomColor({luminosity: 'light'});
    }
    // cssScrollSnapPolyfill()
}
init();
