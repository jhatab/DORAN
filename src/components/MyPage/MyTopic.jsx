import "./MyMain.css";

const MyTopic = () => {

    const topics = ["개발", "봉사활동", "스터디", "맛집-카페", "주류", "반려동물", "영화-드라마", "음악", "책-글쓰기", "게임", "전시-공연", "취미", "러닝", "운동", "여행", "등산", "액티비티"];

    const pickTopic = (d) => {
        for (const val of d)
            return val;
    }

    // topics.map((topic, index) => {return topic;})

    return (
        <>
            <div>
                <div className="myTitle">
                    <h4>관심 주제</h4>
                    <p>관심있는 주제를 선택해주세요</p>
                </div>

                <div className="myTopics">
                    <button>{pickTopic(topics)}
                    </button>
                </div>

            </div>
        </>
    );
}

export default MyTopic;