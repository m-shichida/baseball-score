import React from 'react';

const EditButton = ({ handleClick }) => {
  return (
    <button className='focus:outline-none' onClick={ e => handleClick(e) }>
      <svg className="w-6 text-green-600 cursor-pointer" fill="none" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" viewBox="0 0 24 24" stroke="currentColor">
        <path d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
      </svg>
    </button>
  )
}

export default EditButton;
