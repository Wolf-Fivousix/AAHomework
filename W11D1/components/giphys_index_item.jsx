import React from "react";

export default function GiphysIndexItem({ giphy }) {
    return (
        <img src={giphy.images.fixed_height.url}/>
    );
};