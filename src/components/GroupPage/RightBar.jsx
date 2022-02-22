import "./RightBar.css";

const RightBar = () => {

    return (   
        <> 
            <div className="rightWrapper">
                <p>인기 게시물</p>
                    <div className="groupPopPhoto">
                        <img alt="groupPopImg" src={require("../../Asset/groupImg.jpeg")} />

                        <div className="PopContents">
                        <h4>날이 많이 따뜻해졌는데...</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>

                    <div className="groupPopPhoto">
                        <img alt="groupPopImg" src={require("../../Asset/groupImg.jpeg")} />

                        <div className="PopContents">
                        <h4>날이 많이 따뜻해졌는데...</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>


                    <div className="groupPopPhoto">
                        <img alt="groupPopImg" src={require("../../Asset/groupImg.jpeg")} />

                        <div className="PopContents">
                        <h4>날이 많이 따뜻해졌는데...</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                    
            </div>

        </>

    );
}

export default RightBar;