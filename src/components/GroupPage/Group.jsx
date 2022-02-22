import LeftBar from "./LeftBar";
import MiddleMain from "./MiddleMain";
import RightBar from "./RightBar";

import "./Group.css";
import Search from "./Search";

const Group = () => {

    return (
        <>
            
            <div className="groupWrapper">
                <LeftBar />
                <div>
                <Search />
                <MiddleMain />
                </div>
                
                <RightBar />
            </div>
        </>
    );
}

export default Group;