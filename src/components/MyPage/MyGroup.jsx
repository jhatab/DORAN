import { Link } from "react-router-dom";
import "./MyMain.css";

const MyGroup = () => {

    const exitAlert = () => {
        alert("정말로 탈퇴하시겠습니까?");
    }

    return (
    <>
        <div className="myGroupBox">
            <div className="myGroupWrapper">
                <div className="myGroupText">
                    <p>Lorem Ipsum</p>
                </div>
                <div className="myGroup">
                    <div className="groupChoice">
                    <Link to="/Group">
                        <div className="groupVisit">
                            방문하기</div>
                    </Link>
                        <div className="groupExit" onClick={exitAlert}>탈퇴하기</div>
                    </div>
                    <img src="images/ex1.jpg"/>    
                </div>
            </div>

            <div className="myGroupWrapper">
                <div className="myGroupText">
                    <p>Lorem Ipsum</p>
                </div>
                <div className="myGroup">
                    <div className="groupChoice">
                    <Link to="/Group">
                        <div className="groupVisit">
                            방문하기</div>
                    </Link>
                        <div className="groupExit" onClick={exitAlert}>탈퇴하기</div>
                    </div>
                    <img src="images/ex1.jpg"/>    
                </div>
            </div>


            <div className="myGroupWrapper">
                <div className="myGroupText">
                    <p>Lorem Ipsum</p>
                </div>
                <div className="myGroup">
                    <div className="groupChoice">
                    <Link to="/Group">
                        <div className="groupVisit">
                            방문하기</div>
                    </Link>
                        <div className="groupExit" onClick={exitAlert}>탈퇴하기</div>
                    </div>
                    <img src="images/ex1.jpg"/>    
                </div>
            </div>


            <div className="myGroupWrapper">
                <div className="myGroupText">
                    <p>Lorem Ipsum</p>
                </div>
                <div className="myGroup">
                    <div className="groupChoice">
                    <Link to="/Group">
                        <div className="groupVisit">
                            방문하기</div>
                    </Link>
                        <div className="groupExit" onClick={exitAlert}>탈퇴하기</div>
                    </div>
                    <img src="images/ex1.jpg"/>    
                </div>
            </div>


            <div className="myGroupWrapper">
                <div className="myGroupText">
                    <p>Lorem Ipsum</p>
                </div>
                <div className="myGroup">
                    <div className="groupChoice">
                    <Link to="/Group">
                        <div className="groupVisit">
                            방문하기</div>
                    </Link>
                        <div className="groupExit" onClick={exitAlert}>탈퇴하기</div>
                    </div>
                    <img src="images/ex1.jpg"/>    
                </div>
            </div>


        </div>
    </>
    );
}

export default MyGroup;