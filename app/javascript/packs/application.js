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

$('.card-category').click(function(){
  $(this).toggleClass('expanded');
});

$('.card-category-profile').click(function(){
  $(this).toggleClass('expanded-profile');
});

  // const checks = document.querySelectorAll('.form-check');

  // function toggleActive(event){
  //   // event.currentTarget.classList.('active')
  //   event.currentTarget.classList.toggle('active');
  // }
  // checks.forEach(check => check.addEventListener('click', toggleActive))
});
