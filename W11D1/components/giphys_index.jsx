import React from 'react';

import GiphysIndexItem from './giphys_index_item';

export default function GiphysIndex({ giphys }) {
    return (
        <ul>
            {giphys.map(giphy => <GiphysIndexItem id={giphy.id} giphy={giphy} />)}
        </ul>
    );
};
