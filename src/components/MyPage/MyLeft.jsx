import { useState } from "react";
import "./MyLeft.css";
import MyMain from "./MyMain";

const MyLeft = () => {

    const [topic, setTopic] = useState(false);
    const [group, setGroup] = useState(false);
    const [info, setInfo] = useState(false);


    return (
        <>
            <div className="myPageWrapper">
                <div className="myPageTitle">
                    <h2>My Page</h2>
                </div>

                <div className="myPageList">
                    <button onClick={() => setTopic(!topic)}><li>관심 주제</li></button>
                    <button onClick={() => setGroup(!group)}><li>가입한 그룹</li></button>
                    <button onClick={() => setInfo(!info)}><li>회원 정보</li></button>
                </div>
            </div>

            <MyMain topic={topic} group={group} info={info} />

        </>
    );
}

export default MyLeft;