import MyGroup from "./MyGroup";
import MyInfo from "./MyInfo";
import "./MyMain.css";
import MyTopic from "./MyTopic";

const MyMain = ({topic, group, info}) => {

    return(
        <>
            
                { !topic && !group && !info &&
                    <div className="myWrapper small">
                    <div className="myMain"> 
                        <h1>오늘은 00님이 도란도란을 시작한지 25일!</h1>

                        <div className="myCard">
                            <div className="myProfile">
                                <img src={require("../../Asset/groupImg.jpeg")} />
                                <p>00님</p>
                            </div>

                            <div className="myHistory">
                                <p>내가 작성한 게시물: 5개</p>
                            </div>
                        </div>
                    </div>
                    </div>
                }
                { topic && 
                    <div className="myWrapper small">
                    <MyTopic />
                    </div>
                }

                { group && 
                    <div className="myWrapper">
                    <MyGroup />
                    </div>
                }
                { info && 
                    <div className="myWrapper small">
                    <MyInfo />
                    </div>
                }
            
        </>
    );
}

export default MyMain;