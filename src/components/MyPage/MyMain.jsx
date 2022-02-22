import MyGroup from "./MyGroup";
import MyInfo from "./MyInfo";
import "./MyMain.css";
import MyTopic from "./MyTopic";

const MyMain = ({topic, group, info}) => {

    return(
        <>
            <div className="myWrapper">
                { !topic && !group && !info &&
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

                }
                { topic && <MyTopic />}
                { group && <MyGroup />}
                { info && <MyInfo />}
            </div>
        </>
    );
}

export default MyMain;