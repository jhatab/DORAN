import LeftBar from "./LeftBar";
import "./MiddleMain.css";
import RightBar from "./RightBar";

const MiddleMain = () => {

    return (
        <>
        <div className="groupFeed">            
            <div className="middleWrapper">
                <div className="groupFeedUpper">
                    <div className="groupId">
                        <img alt="groupIdImg" src={require("../../Asset/groupImg.jpeg")} />
                        <p>Lorem Ipsum</p>
                        <span>2022/02/21 15:13</span>
                    </div>
                    <div className="groupFeedMenu">
                        <img alt="feed menu" src={require("../../Asset/dots.png")} />
                    </div>
                </div>

                <div className="middleContents">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac ex vitae nulla varius auctor. Duis vitae magna a diam ultricies porta ac nec eros. Sed fringilla scelerisque tellus, sodales pharetra lectus porttitor in. Nulla a erat eu mi ultrices condimentum. Aenean non cursus ante, et commodo massa. Phasellus eleifend ante non ipsum tristique, sed porta justo consequat. Mauris at nunc condimentum, consequat nulla et, cursus turpis.

Suspendisse a quam ac ante efficitur hendrerit. Vestibulum ac eros nec erat scelerisque convallis. Fusce finibus neque nec ligula euismod vestibulum. Quisque semper tristique dui et interdum. Pellentesque vitae lobortis nulla, in blandit sapien. Pellentesque ut bibendum mauris, vitae semper ipsum. Nullam porta aliquam interdum.

Proin vulputate et quam non euismod. Pellentesque quis augue lacus. Aliquam suscipit arcu massa, a maximus tellus tincidunt in. Nam ultricies lectus non arcu luctus, ut imperdiet felis mattis. Morbi mattis euismod eros, tristique malesuada purus auctor et. Fusce neque nunc, viverra pellentesque mauris non, elementum condimentum enim. Aliquam placerat tortor vel urna aliquam maximus. Sed ut neque mi. Sed ut nisl auctor, fringilla sem non, dictum ante. Morbi ac turpis ut justo eleifend porta consectetur eget nisl. Cras elementum tortor mi.
                    </p>
                </div>

                <div className="groupFeedLower">
                    <div className="groupHash">
                        <span>#Tag</span><span>#Tag</span><span>#Tag</span>
                    </div>
                    <div className="groupLike">
                        <img alt="like" src={require("../../Asset/like.png")} />
                        <p>20</p>
                    </div>
                </div>

                <div className="groupFeedImg">
                    <img alt="groupFeedImg" src={require("../../Asset/groupImg.jpeg")} />
                    <img alt="groupFeedImg" src={require("../../Asset/groupImg.jpeg")} />
                    <img alt="groupFeedImg" src={require("../../Asset/groupImg.jpeg")} />
                </div>
            </div>
            <div className="groupComment">
                <span>Lorem Ipsum</span>
                <p>orem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <span>댓글</span>
                <span>15</span>
            </div>
            <div className="groupReadMore">
                <p>더보기</p>
                <img alt="read more" src={require("../../Asset/down-arrow.png")} />
            </div>
        </div>


{/* 작은 피드 */}
        <div className="groupFeed_small groupFeed">  
            <div className="groupFeedImg">
                <img alt="groupFeedImg" src={require("../../Asset/groupImg.jpeg")} />
            </div>

            <div className="middleWrapper_small middleWrapper">
                <div className="groupFeedUpper_small groupFeedUpper">
                    <div className="groupId_small groupId">
                            <img alt="group feed image" src={require("../../Asset/groupImg.jpeg")} />
                            <p>Lorem Ipsum</p>
                            <span>2022/02/21 15:13</span>
                    </div>
                    <div className="groupLike_small groupLike">
                                <img alt="like" src={require("../../Asset/like.png")} />
                                <p>20</p>
                    </div>
                </div>

                <div className="middleContents_small middleContents">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac ex vitae nulla varius auctor. Duis vitae magna a diam ultricies porta ac nec eros. Sed fringilla scelerisque tellus, sodales pharetra lectus porttitor in. Nulla a erat eu mi ultrices condimentum. Aenean non cursus ante, et commodo massa.
                    </p>
                </div>
            </div>
        </div>

        </>
    );
}

export default MiddleMain;
