import React, {useState} from 'react';
import './ContentNav.css';
import { Link } from "react-router-dom"

const ContentNav = () => {
    const [activeIndex, setActiveIndex]=useState(0);

    const tabClickHandler=(index)=>{
        setActiveIndex(index);
    };

    const tabContArr=[
        {
            tabTitle:(
                <li className={activeIndex===0 ? "active" : "unactive"} onClick={()=>tabClickHandler(0)}> 운동 </li>
            ),
            tabCont:(
                <div className="content_box"> 
                <div className="content_list"></div>
                <div className="content_list"></div>
                <div className="content_list"></div>
                <div className="content_list"></div> </div>
            )
        },
        {
            tabTitle:(
                <li className={activeIndex===1 ? "active" : "unactive"} onClick={()=>tabClickHandler(1)}> 여행 </li>
            ),
            tabCont:(
                <div> 탭2 내용 </div>
            )
        },
        {
            tabTitle:(
                <li className={activeIndex===2 ? "active" : "unactive"} onClick={()=>tabClickHandler(2)}> 요리 </li>
            ),
            tabCont:(
                <div> 탭3 내용 </div>
            )
        },
        {
            tabTitle:(
                <li className={activeIndex===3 ? "active" : "unactive"} onClick={()=>tabClickHandler(3)}> 뷰티 메이크업 </li>
            ),
            tabCont:(
                <div> 탭4 내용 </div>
            )
        },
        {
            tabTitle:(
                <li className={activeIndex===4 ? "active" : "unactive"} onClick={()=>tabClickHandler(4)}> 투자 </li>
            ),
            tabCont:(
                <div> 탭5 내용 </div>
            )
        },
        {
            tabTitle:(
                <li className={activeIndex===5 ? "active" : "unactive"} onClick={()=>tabClickHandler(5)}> 아웃도어/여행 </li>
            ),
            tabCont:(
                <div> 탭6 내용 </div>
            )
        },
        {
            tabTitle:(
                <li className={activeIndex===6 ? "active" : "unactive"} onClick={()=>tabClickHandler(6)}> 외국어 </li>
            ),
            tabCont:(
                <div> 탭7 내용 </div>
            )
        },
        {
            tabTitle:(
                <li className={activeIndex===7 ? "active" : "unactive"} onClick={()=>tabClickHandler(7)}> 음악 </li>
            ),
            tabCont:(
                <div> 탭7 내용 </div>
            )
        },
        {
            tabTitle:(
                <li className={activeIndex===8 ? "active" : "unactive"} onClick={()=>tabClickHandler(8)}> 음악 </li>
            ),
            tabCont:(
                <div> 탭8 내용 </div>
            )
        }

    ];

    return (
        <div className="content">
            <div className="content_tab">
          <ul className="content_btn">
            {tabContArr.map((section, index)=>{
                return section.tabTitle
            })}
          </ul>
          </div>
          <div>
          	{tabContArr[activeIndex].tabCont}
          </div>
        </div>
    );
}

export default ContentNav;