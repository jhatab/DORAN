import React, { useState } from 'react';
import './ContentNav.css';
import { Link } from "react-router-dom"

const ContentNav = () => {
    const [activeIndex, setActiveIndex] = useState(0);

    const tabClickHandler = (index) => {
        setActiveIndex(index);
    };

    const tabContArr = [
        {
            tabTitle: (
                <li className={activeIndex === 0 ? "active" : "unactive"} onClick={() => tabClickHandler(0)}> 운동 </li>
            ),
            tabCont: (
                <div className="content_box">
                    <div className="content_list"><div className="text_box"><h1>Lorem Insum</h1><p>Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset  </p></div>
                        <div className="like_view"><img src="images/like.png" /><span>36</span></div>
                        <div className="content_img"><img src="images/sports1.jpg" /></div>
                        <div className="comment_view"><span>2022-02-16&nbsp;</span><span>&nbsp;Comment 26</span></div>
                        </div>
                    <div className="content_list"><div className="text_box"><h1>Lorem Insum</h1><p>Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset  </p></div>
                        <div className="like_view"><img src="images/like.png" /><span>27</span></div>
                        <div className="content_img"><img src="images/sports2.jpg" /></div>
                        <div className="comment_view"><span>2022-02-15&nbsp;</span><span>&nbsp;Comment 23</span></div>
                        </div>
                    <div className="content_list"><div className="text_box"><h1>Lorem Insum</h1><p>Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset  </p></div>
                        <div className="like_view"><img src="images/like.png" /><span>17</span></div>
                        <div className="content_img"><img src="images/sports3.jpg" /></div>
                        <div className="comment_view"><span>2022-02-16&nbsp;</span><span>&nbsp;Comment 11</span></div>
                        </div>
                    <div className="content_list"><div className="text_box"><h1>Lorem Insum</h1><p>Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset  </p></div>
                        <div className="like_view"><img src="images/like.png" /><span>15</span></div>
                        <div className="content_img"><img src="images/sports4.jpg" /></div>
                        <div className="comment_view"><span>2022-02-17&nbsp;</span><span>&nbsp;Comment 27</span></div>
                        </div> </div>
            )
        },
        {
            tabTitle: (
                <li className={activeIndex === 1 ? "active" : "unactive"} onClick={() => tabClickHandler(1)}> 여행 </li>
            ),
            tabCont: (
                <div className="content_box">
                    <div className="content_list"><div className="text_box"><h1>Lorem Insum</h1><p>Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset  </p></div>
                        <div className="like_view"><img src="images/like.png" /><span>36</span></div>
                        <div className="content_img"><img src="images/travel1.jpg" /></div>
                        <div className="comment_view"><span>2022-02-16&nbsp;</span><span>&nbsp;Comment 26</span></div>
                        </div>
                    <div className="content_list"><div className="text_box"><h1>Lorem Insum</h1><p>Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset  </p></div>
                        <div className="like_view"><img src="images/like.png" /><span>27</span></div>
                        <div className="content_img"><img src="images/travel2.jpg" /></div>
                        <div className="comment_view"><span>2022-02-15&nbsp;</span><span>&nbsp;Comment 23</span></div>
                        </div>
                    <div className="content_list"><div className="text_box"><h1>Lorem Insum</h1><p>Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset  </p></div>
                        <div className="like_view"><img src="images/like.png" /><span>17</span></div>
                        <div className="content_img"><img src="images/travel3.jpg" /></div>
                        <div className="comment_view"><span>2022-02-16&nbsp;</span><span>&nbsp;Comment 11</span></div>
                        </div>
                    <div className="content_list"><div className="text_box"><h1>Lorem Insum</h1><p>Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset  </p></div>
                        <div className="like_view"><img src="images/like.png" /><span>15</span></div>
                        <div className="content_img"><img src="images/travel4.jpg" /></div>
                        <div className="comment_view"><span>2022-02-17&nbsp;</span><span>&nbsp;Comment 27</span></div>
                        </div> </div>
            )
        },
        {
            tabTitle: (
                <li className={activeIndex === 2 ? "active" : "unactive"} onClick={() => tabClickHandler(2)}> 요리 </li>
            ),
            tabCont: (
                <div> 탭3 내용 </div>
            )
        },
        {
            tabTitle: (
                <li className={activeIndex === 3 ? "active" : "unactive"} onClick={() => tabClickHandler(3)}> 뷰티 메이크업 </li>
            ),
            tabCont: (
                <div> 탭4 내용 </div>
            )
        },
        {
            tabTitle: (
                <li className={activeIndex === 4 ? "active" : "unactive"} onClick={() => tabClickHandler(4)}> 투자 </li>
            ),
            tabCont: (
                <div> 탭5 내용 </div>
            )
        },
        {
            tabTitle: (
                <li className={activeIndex === 5 ? "active" : "unactive"} onClick={() => tabClickHandler(5)}> 아웃도어/여행 </li>
            ),
            tabCont: (
                <div> 탭6 내용 </div>
            )
        },
        {
            tabTitle: (
                <li className={activeIndex === 6 ? "active" : "unactive"} onClick={() => tabClickHandler(6)}> 외국어 </li>
            ),
            tabCont: (
                <div> 탭7 내용 </div>
            )
        },
        {
            tabTitle: (
                <li className={activeIndex === 7 ? "active" : "unactive"} onClick={() => tabClickHandler(7)}> 음악 </li>
            ),
            tabCont: (
                <div> 탭7 내용 </div>
            )
        },
        {
            tabTitle: (
                <li className={activeIndex === 8 ? "active" : "unactive"} onClick={() => tabClickHandler(8)}> 게임 </li>
            ),
            tabCont: (
                <div> 탭8 내용 </div>
            )
        }

    ];

    return (
        <div className="content">
            <div className="content_tab">
                <ul className="content_btn">
                    {tabContArr.map((section, index) => {
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