import "./LeftBar.css";
import RightBar from "./RightBar";

const LeftBar = () => {

    return (
            <div className="leftWrapper">
                <div className="groupPhoto">
                    <img src={require("../../Asset/groupImg.jpeg")} />
                </div>

                

                <div className="contents">
                <h3>도란도란</h3>
                <p>파이널 프로젝트를 위해 모인 4조 도란도란입니다. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac ex vitae nulla varius auctor.
                </p>
                <button id="groupBtn">가입하기</button>
                </div>

                

            </div>

    );
}

export default LeftBar;