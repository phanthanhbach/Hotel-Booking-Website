$(document).ready(function(){
    $('.product-container').slick({
        infinite: false,
        slidesToShow: 3,
        slidesToScroll: 1,
        arrow: true,
        draggable:false,
        dots: true, 
        prevArrow:"<button type='button' class='slick-prev pull-left'><i class='fa fa-angle-left' aria-hidden='true'></i></button>",
        nextArrow:"<button type='button' class='slick-next pull-right'><i class='fa fa-angle-right' aria-hidden='true'></i></button>",
    responsive: [
    {
      breakpoint: 1025,
      settings: {
        slidesToShow: 2,
        
      }
    },
    {
      breakpoint: 700,
      settings: {
        slidesToShow: 2,
    
      }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 1,
      }
    }
  
  ]
    });
  
       
  });

