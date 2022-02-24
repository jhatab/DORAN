import React, {useState} from 'react';
import './Subnav.css'
import Slider from "react-slick";
import "./Slidegroup.css";
import "./slick-carousel/slick/slick.css";
import "./slick-carousel/slick/slick-theme.css";
import { Link } from "react-router-dom"

const Subnav = () => {

    const [activeIndex, setActiveIndex]=useState(0);

    const tabClickHandler=(index)=>{
        setActiveIndex(index);
    };

    const settings = {
        dots: false,
        infinite: false,
        speed: 500,
        slidesToShow: 4,
        slidesToScroll: 3
      };

    const tabContArr=[
        {
            tabTitle:(
                <li className={activeIndex===0 ? "is-active" : ""} onClick={()=>tabClickHandler(0)}> 추천순 </li>
            ),
            tabCont:(
                <div className="Slide_Content">
          <Slider {...settings}>
            <div><Link to="/Group">
              <img src="images/ex1.jpg"/></Link>
              <div className="group_name"><p>Lorem Ipsum</p></div>
            </div>
            <div>
            <Link to="/Group">
            <img src="images/ex2.jpg"/> </Link>
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
        },
        {
            tabTitle:(
                <li className={activeIndex===1 ? "is-active" : ""} onClick={()=>tabClickHandler(1)}> 최신순 </li>
            ),
            tabCont:(
                <div className="Slide_Content">
          <Slider {...settings}>
            <div>
              <img src="images/ex6.jpg"/>
              <div className="group_name"><p>Lorem Ipsum</p></div>
            </div>
            <div>
            <img src="images/ex7.jpg"/>
            <div className="group_name"><p>Lorem Ipsum</p></div>
            </div>
            <div>
            <img src="images/ex8.jpg"/>
            <div className="group_name"><p>Lorem Ipsum</p></div>
            </div>
            <div>
            <img src="images/ex9.jpg"/>
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
    ];
    
    return(
        <div>
        <div className="sub">
            <div className="sub_nav">
        <ul className="list_btn">
          {tabContArr.map((section, index)=>{
              return section.tabTitle
          })}
        </ul>
        </div>
        </div>
        <div>
            {tabContArr[activeIndex].tabCont}
        </div>
        </div>
      
    )
}

export default Subnav;