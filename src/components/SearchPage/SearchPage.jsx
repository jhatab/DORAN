import './SearchPage.css';
import React, { useState } from 'react';
import { Link } from "react-router-dom"

const SearchPage = () => {

    const [activeIndex, setActiveIndex] = useState(0);

    const tabClickHandler = (index) => {
        setActiveIndex(index);
    };

    const tabContArr = [
        {
            tabTitle: (
                <li className={activeIndex === 0 ? "is-active" : ""} onClick={() => tabClickHandler(0)}> 내용 </li>
            ),
            tabCont: (
                <div className="Search_area">
                    <div className="Search_list">
                        <div className="Search_result">
                            <div className="Search_img"><img src="images/ex1.jpg" /></div>
                            <div className="Search_content">
                                <div className="Content_header">
                                    <img src="images/chatbot.png" />
                                    <h1>Lorem Insum</h1>
                                    <span>2022-02-23</span>
                                    <div className="search_like_view">
                                        <img src="images/like.png" />
                                        <span>13</span>
                                    </div>
                                </div>
                                <div className="Content_body"><span>Lorem Ipsum is simply dummy text of the printing and typesetting
                                    industry. Lorem Ipsum has been the industry’s standard dummy
                                    text ever since the 1500s, when an unknown printer took a galley
                                    of type and scrambled it to make a type specimen book.
                                    It has survived not only five centuries, but also the leap into
                                    electronic typesetting, remaining essentially unchanged. It was
                                    popularised in the 1960s with the release of Letraset </span></div>

                            </div>
                        </div>
                        <div className="Search_result">
                        <div className="Search_img"><img src="images/ex2.jpg" /></div>
                            <div className="Search_content">
                                <div className="Content_header">
                                    <img src="images/chatbot.png" />
                                    <h1>Lorem Insum</h1>
                                    <span>2022-02-22</span>
                                    <div className="search_like_view">
                                        <img src="images/like.png" />
                                        <span>20</span>
                                    </div>
                                </div>
                                <div className="Content_body"><span>Lorem Ipsum is simply dummy text of the printing and typesetting
                                    industry. Lorem Ipsum has been the industry’s standard dummy
                                    text ever since the 1500s, when an unknown printer took a galley
                                    of type and scrambled it to make a type specimen book.
                                    It has survived not only five centuries, but also the leap into
                                    electronic typesetting, remaining essentially unchanged. It was
                                    popularised in the 1960s with the release of Letraset </span></div>

                            </div>
                        </div>
                        <div className="Search_result">
                        <div className="Search_img"><img src="images/ex3.jpg" /></div>
                            <div className="Search_content">
                                <div className="Content_header">
                                    <img src="images/chatbot.png" />
                                    <h1>Lorem Insum</h1>
                                    <span>2022-02-18</span>
                                    <div className="search_like_view">
                                        <img src="images/like.png" />
                                        <span>4</span>
                                    </div>
                                </div>
                                <div className="Content_body"><span>Lorem Ipsum is simply dummy text of the printing and typesetting
                                    industry. Lorem Ipsum has been the industry’s standard dummy
                                    text ever since the 1500s, when an unknown printer took a galley
                                    of type and scrambled it to make a type specimen book.
                                    It has survived not only five centuries, but also the leap into
                                    electronic typesetting, remaining essentially unchanged. It was
                                    popularised in the 1960s with the release of Letraset </span></div>

                            </div>
                        </div>
                        <div className="Search_result"><div className="Search_img"><img src="images/ex4.jpg" /></div>
                            <div className="Search_content">
                                <div className="Content_header">
                                    <img src="images/chatbot.png" />
                                    <h1>Lorem Insum</h1>
                                    <span>2022-02-14</span>
                                    <div className="search_like_view">
                                        <img src="images/like.png" />
                                        <span>9</span>
                                    </div>
                                </div>
                                <div className="Content_body"><span>Lorem Ipsum is simply dummy text of the printing and typesetting
                                    industry. Lorem Ipsum has been the industry’s standard dummy
                                    text ever since the 1500s, when an unknown printer took a galley
                                    of type and scrambled it to make a type specimen book.
                                    It has survived not only five centuries, but also the leap into
                                    electronic typesetting, remaining essentially unchanged. It was
                                    popularised in the 1960s with the release of Letraset </span></div>

                            </div></div>
                        <div className="Search_result"><div className="Search_img"><img src="images/ex5.jpg" /></div>
                            <div className="Search_content">
                                <div className="Content_header">
                                    <img src="images/chatbot.png" />
                                    <h1>Lorem Insum</h1>
                                    <span>2022-02-17</span>
                                    <div className="search_like_view">
                                        <img src="images/like.png" />
                                        <span>19</span>
                                    </div>
                                </div>
                                <div className="Content_body"><span>Lorem Ipsum is simply dummy text of the printing and typesetting
                                    industry. Lorem Ipsum has been the industry’s standard dummy
                                    text ever since the 1500s, when an unknown printer took a galley
                                    of type and scrambled it to make a type specimen book.
                                    It has survived not only five centuries, but also the leap into
                                    electronic typesetting, remaining essentially unchanged. It was
                                    popularised in the 1960s with the release of Letraset </span></div>

                            </div></div>
                        <div></div>
                        <div className="Search_page">
                            <span>1</span>
                            <span>2</span>
                            <span>3</span>
                            <span>4</span>
                            <span>5</span>
                            <span>6</span>
                            <span>7</span>
                            <span>8</span>
                            <span>9</span>
                            <span>10</span>
                        </div>
                    </div>
                </div>
            )
        },
        {
            tabTitle: (
                <li className={activeIndex === 1 ? "is-active" : ""} onClick={() => tabClickHandler(1)}> 태그별 </li>
            ),
            tabCont: (
                <div className="Search_area">
                <div className="Search_list">
                    <div className="Search_result">
                        <div className="Search_img"><img src="images/ex6.jpg" /></div>
                        <div className="Search_content">
                            <div className="Content_header">
                                <img src="images/chatbot.png" />
                                <h1>Lorem Insum</h1>
                                <span>2022-02-23</span>
                                <div className="search_like_view">
                                    <img src="images/like.png" />
                                    <span>13</span>
                                </div>
                            </div>
                            <div className="Content_body"><span>Lorem Ipsum is simply dummy text of the printing and typesetting
                                industry. Lorem Ipsum has been the industry’s standard dummy
                                text ever since the 1500s, when an unknown printer took a galley
                                of type and scrambled it to make a type specimen book.
                                It has survived not only five centuries, but also the leap into
                                electronic typesetting, remaining essentially unchanged. It was
                                popularised in the 1960s with the release of Letraset </span></div>

                        </div>
                    </div>
                    <div className="Search_result">
                    <div className="Search_img"><img src="images/ex7.jpg" /></div>
                        <div className="Search_content">
                            <div className="Content_header">
                                <img src="images/chatbot.png" />
                                <h1>Lorem Insum</h1>
                                <span>2022-02-22</span>
                                <div className="search_like_view">
                                    <img src="images/like.png" />
                                    <span>20</span>
                                </div>
                            </div>
                            <div className="Content_body"><span>Lorem Ipsum is simply dummy text of the printing and typesetting
                                industry. Lorem Ipsum has been the industry’s standard dummy
                                text ever since the 1500s, when an unknown printer took a galley
                                of type and scrambled it to make a type specimen book.
                                It has survived not only five centuries, but also the leap into
                                electronic typesetting, remaining essentially unchanged. It was
                                popularised in the 1960s with the release of Letraset </span></div>

                        </div>
                    </div>
                    <div className="Search_result">
                    <div className="Search_img"><img src="images/ex8.jpg" /></div>
                        <div className="Search_content">
                            <div className="Content_header">
                                <img src="images/chatbot.png" />
                                <h1>Lorem Insum</h1>
                                <span>2022-02-18</span>
                                <div className="search_like_view">
                                    <img src="images/like.png" />
                                    <span>4</span>
                                </div>
                            </div>
                            <div className="Content_body"><span>Lorem Ipsum is simply dummy text of the printing and typesetting
                                industry. Lorem Ipsum has been the industry’s standard dummy
                                text ever since the 1500s, when an unknown printer took a galley
                                of type and scrambled it to make a type specimen book.
                                It has survived not only five centuries, but also the leap into
                                electronic typesetting, remaining essentially unchanged. It was
                                popularised in the 1960s with the release of Letraset </span></div>

                        </div>
                    </div>
                    <div className="Search_result"><div className="Search_img"><img src="images/ex9.jpg" /></div>
                        <div className="Search_content">
                            <div className="Content_header">
                                <img src="images/chatbot.png" />
                                <h1>Lorem Insum</h1>
                                <span>2022-02-14</span>
                                <div className="search_like_view">
                                    <img src="images/like.png" />
                                    <span>9</span>
                                </div>
                            </div>
                            <div className="Content_body"><span>Lorem Ipsum is simply dummy text of the printing and typesetting
                                industry. Lorem Ipsum has been the industry’s standard dummy
                                text ever since the 1500s, when an unknown printer took a galley
                                of type and scrambled it to make a type specimen book.
                                It has survived not only five centuries, but also the leap into
                                electronic typesetting, remaining essentially unchanged. It was
                                popularised in the 1960s with the release of Letraset </span></div>

                        </div></div>
                    <div className="Search_result"><div className="Search_img"><img src="images/ex5.jpg" /></div>
                        <div className="Search_content">
                            <div className="Content_header">
                                <img src="images/chatbot.png" />
                                <h1>Lorem Insum</h1>
                                <span>2022-02-17</span>
                                <div className="search_like_view">
                                    <img src="images/like.png" />
                                    <span>19</span>
                                </div>
                            </div>
                            <div className="Content_body"><span>Lorem Ipsum is simply dummy text of the printing and typesetting
                                industry. Lorem Ipsum has been the industry’s standard dummy
                                text ever since the 1500s, when an unknown printer took a galley
                                of type and scrambled it to make a type specimen book.
                                It has survived not only five centuries, but also the leap into
                                electronic typesetting, remaining essentially unchanged. It was
                                popularised in the 1960s with the release of Letraset </span></div>

                        </div></div>
                    <div></div>
                    <div className="Search_page">
                        <span>1</span>
                        <span>2</span>
                        <span>3</span>
                        <span>4</span>
                        <span>5</span>
                        <span>6</span>
                        <span>7</span>
                        <span>8</span>
                        <span>9</span>
                        <span>10</span>
                    </div>
                </div>
            </div>
            )
        }
    ];
    return (
        <div>
            <div className="sub">
                <div className="sub_nav">
                    <ul className="list_btn">
                        {tabContArr.map((section, index) => {
                            return section.tabTitle
                        })}
                    </ul>
                </div>
            </div>
            <div>
                {tabContArr[activeIndex].tabCont}
            </div>
        </div>
    );
}


export default SearchPage;