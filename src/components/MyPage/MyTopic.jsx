import { useRef, useState } from "react";
import "./MyMain.css";

const MyTopic = () => {

    const topics = ["개발", "봉사활동", "스터디", "맛집-카페", "주류", "반려동물", "영화-드라마", "음악", "책-글쓰기", "게임", "전시-공연", "취미", "러닝", "운동", "여행", "등산", "액티비티"];

    const PickTopic = ({topic}) => {
        return(
            <button value={topic} onClick={(e) => picked(e)}>{topic}</button>
        )
    }

    const chosen = useRef();

    const [chosenD,setChosenD] = useState([""]);

    const picked = (e) => {
        console.dir(chosenD);

        for (let i=0; i<chosenD.length; i++) {
            if(chosenD[i] == e.target.value)
                setChosenD([...chosenD]);
            else if(chosenD.length === 0)
            chosenD.concat(e.targe.value);
            else setChosenD([...chosenD, e.target.value]);
        }
    }

    const cancled = (e) => {
        console.dir(e.target.innerText);
        setChosenD(chosenD.filter(data => data !== e.target.innerText));
    }

    return (
        <>

            <div className="myTitle">
                    <h3>00님의 관심 주제</h3>
                    <p>관심이 있는 주제를 선택해주세요 또는 최대 0개까지 선택이 가능합니다</p>
                

                <div className="chosenTopic" ref={chosen}>
                    {chosenD.map((data,index) => (<div key={index} onClick={e => cancled(e)} value={data}>{data}</div>))}
                </div>

                <div className="myTopics" >
                    {topics.map((topic, index) => 
                        (<PickTopic topic={topic} key={index} />))}
                </div>
            </div>

        </>
    );
}

export default MyTopic;