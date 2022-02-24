import "./MyMain.css";

const MyInfo = () => {

    return(
        <>
            <div className="infoWrapper">
                <div className="idInfo"><h3>아이디</h3></div>
                <div className="idVal">doran</div>
                <div className="pwdInfo"><h3>비밀번호</h3></div>
                <div className="pwdVal">................</div>
                <div className="nameInfo"><h3>이름</h3></div>
                <div className="nameVal">김도란</div>
                <div className="emailInfo"><h3>이메일</h3></div>
                <div className="emailVal">doran@email.co.kr</div>
                <div className="addrInfo"><h3>주소</h3></div>
                <div className="addrVal">경기도 도란시 도란동</div>
                <div className="birthInfo"><h3>생년월일</h3></div>
                <div className="birthVal">1999.07.19</div>
                
            </div>
            <div className="modifyBtn"><button>회원 정보 수정</button></div>
        </>
    );
}

export default MyInfo;