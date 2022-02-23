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
                    <button onClick={() => {setTopic(!topic); setGroup(false); setInfo(false)}}>관심 주제</button>
                    <button onClick={() => {setGroup(!group); setTopic(false); setInfo(false)}}>가입한 그룹</button>
                    <button onClick={() => {setInfo(!info); setTopic(false); setGroup(false)}}>회원 정보</button>
                </div>
            </div>

            <MyMain topic={topic} group={group} info={info} />

        </>
    );
}

export default MyLeft;