import React, { useState } from 'react';
import axios from 'axios';

import EditButton from '../Button/Edit';
import TrashButton from '../Button/Trash';

const Table = ({ teams }) => {
  const [name, setName] = useState('');
  const handleClick = (e) => {
    e.preventDefault();
    axios.post(`${gon.root_url}teams`, { params: { name }})
  };

  return (
    <>
      <article className=''>
        <label className='block w-full text-gray-700 text-xs font-bold'>
          チーム登録
        </label>
        <form className='flex justify-between w-full mt-1'>
          <input value={name} onChange={e => setName(e.target.value)} className='shadow border rounded block appearance-none text-gray-700 text-sm font-bold p-2 w-11/12 focus:shadow-outline focus:outline-none' placeholder='チーム名' />
          <button onClick={e => handleClick(e)} className='rounded bg-blue-500 text-white font-bold ml-2 py-2 px-4 hover:bg-blue-700 focus:outline-none focus:shadow-outline'>
            登録
          </button>
        </form>
      </article>
      <table className='table-fixed border-collapse w-full mt-6'>
        <thead>
          <tr className='bg-gray-300'>
            <th className='p-1 border text-sm w-11/12'>チーム名</th>
            <th className='p-1 border' />
          </tr>
        </thead>
        <tbody>
          {teams.map((team, i) => (
            <tr className='hover:bg-green-100' key={i}>
              <td className='border px-2 py-1'>{team.name}</td>
              <td className='border px-2 py-1'>
                <span className='flex justify-around'>
                  <EditButton />
                  <TrashButton />
                </span>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </>
  );
}

export default Table;
