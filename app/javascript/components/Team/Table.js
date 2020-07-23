import React, { useState } from 'react';
import axios from 'axios';

import EditButton from '../Button/Edit';
import TrashButton from '../Button/Trash';

const Table = ({ teams }) => {
  const [name, setName] = useState('');
  const [data, setData] = useState(teams);
  const handleClickPost = (e) => {
    e.preventDefault();
    axios
      .post(`${gon.root_url}teams`, { team: { name }})
      .then((response) => {
        if (response.status === 200) {
          setData([...data, response.data.team]);
          setName('');
        } else {
          console.log(response.status)
          console.log(response.message)
        }
      });
  };

  const handleClickDelete = (e, id) => {
    e.preventDefault();
    if (window.confirm('本当に削除してもよろしいですか？')) {
      axios
        .delete(`${gon.root_url}teams/${id}`)
        .then((response) => {
          if (response.status === 200) {
            const newData = data.filter(team => team.id !== id);
            setData(newData);
          } else {
            console.log(response.status)
            console.log(response.message)
          }
        });
    }
  };

  return (
    <>
      <article className=''>
        <label className='block w-full text-gray-700 text-xs font-bold'>
          チーム登録
        </label>
        <form className='flex justify-between w-full mt-1'>
          <input value={name} onChange={e => setName(e.target.value)} className='shadow border rounded block appearance-none text-gray-700 text-sm font-bold p-2 w-11/12 focus:shadow-outline focus:outline-none' placeholder='チーム名' />
          <button onClick={e => handleClickPost(e)} className='rounded bg-blue-500 text-white font-bold ml-2 py-2 px-4 hover:bg-blue-700 focus:outline-none focus:shadow-outline'>
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
          {data.map((team, i) => (
            <>
              <tr className='hover:bg-green-100' key={i}>
                <td className='border px-2 py-1'>{team.name}</td>
                <td className='border px-2 py-1'>
                  <span className='flex justify-around'>
                    <EditButton />
                    <TrashButton handleClick={handleClickDelete} id={team.id}/>
                  </span>
                </td>
              </tr>
            </>
          ))}
        </tbody>
      </table>
    </>
  );
}

export default Table;
