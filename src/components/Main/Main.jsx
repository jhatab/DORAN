import React from 'react';
import ContentNav from './ContentNav';
import MainHeader from './MainHeader';
import Subnav from './Subnav';

const Main = () => {
    return(
        <div>
            <MainHeader />
            {/* <Subnav /> */}
            <ContentNav />
        </div>
    )
}
export default Main;