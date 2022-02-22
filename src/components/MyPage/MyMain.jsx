import "./MyMain.css";
import MyTopic from "./MyTopic";

const MyMain = (topic, group, info) => {

    return(
        <>
            <div className="myWrapper">
                
                <MyTopic />
                
            </div>
        </>
    );
}

export default MyMain;