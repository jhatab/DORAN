import "./MiddleMain.css";

const Search = () => {

    return (
        <div className="searchWrite">
            <img alt="search in Group" src={require("../../Asset/search.png")} />
            <input placeholder="그룹 내 게시글을 검색해보세요"/>
            <button className="groupWrite">피드 작성</button>
        </div>
    );
}

export default Search;