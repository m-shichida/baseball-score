import React, { useState } from 'react';

const TeamForm = ({ teamId, name, handleClickUpdate }) => {
  const [value, setValue] = useState(name);

  return (
    <>
      <input value={value} onChange={(e) => setValue(e.target.value)} className='w-full shadow border rounded block appearance-none text-gray-700 text-sm font-bold p-2 w-11/12 focus:shadow-outline focus:outline-none' placeholder='チーム名' />
      <span className='w-1/12 text-right'>
        <button onClick={() => handleClickUpdate(teamId, value)} className='text-sm rounded bg-blue-500 text-white font-bold ml-2 py-2 px-4 hover:bg-blue-700 focus:outline-none focus:shadow-outline'>
          更新
        </button>
      </span>
    </>
  )
}

export default TeamForm;
