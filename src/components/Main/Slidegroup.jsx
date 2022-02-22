import React from 'react';
import Slider from "react-slick";
import "./Slidegroup.css";
import "./slick-carousel/slick/slick.css";
import "./slick-carousel/slick/slick-theme.css";


const Slidegroup = () => {
    const settings = {
        dots: false,
        infinite: false,
        speed: 500,
        slidesToShow: 4,
        slidesToScroll: 1
      };
      return (

        <div className="Slide_Content">
          <Slider {...settings}>
            <div>
              <img src="images/ex1.jpg"/>
              <div className="group_name"><p>Lorem Ipsum</p></div>
            </div>
            <div>
            <img src="images/ex2.jpg"/>
            <div className="group_name"><p>Lorem Ipsum</p></div>
            </div>
            <div>
            <img src="images/ex3.jpg"/>
            <div className="group_name"><p>Lorem Ipsum</p></div>
            </div>
            <div>
            <img src="images/ex4.jpg"/>
            <div className="group_name"><p>Lorem Ipsum</p></div>
            </div>
            <div>
            <img src="images/ex5.jpg"/>
            <div className="group_name"><p>Lorem Ipsum</p></div>
            </div>
            <div>
            <img src="images/ex1.jpg"/>
            <div className="group_name"><p>Lorem Ipsum</p></div>
            </div>
            <div>
            <img src="images/ex1.jpg"/>
            <div className="group_name"><p>Lorem Ipsum</p></div>
            </div>
          </Slider>
        </div>
      )
}

export default Slidegroup;