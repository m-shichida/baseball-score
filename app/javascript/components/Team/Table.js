import React, { useState } from 'react';
import axios from 'axios';

import EditButton from '../Button/Edit';
import TrashButton from '../Button/Trash';
import Form from './Form';

const Table = ({ teams }) => {
  const [name, setName] = useState('');
  const [data, setData] = useState(teams);
  const [alert, setAlert] = useState({});
  const handleClickPost = (e) => {
    e.preventDefault();
    if (name.length) {
      axios
      .post(`${gon.root_url}teams`, { team: { name }})
      .then((response) => {
        if (response.status === 200) {
          setData([...data, response.data.team]);
          setName('');
          const alert = document.getElementById('alert');
          alert.classList.remove('hidden');
          setAlert({ status: response.status, message: response.data.message })
        } else {
          const alert = document.getElementById('alert');
          alert.classList.remove('hidden');
          setAlert({ status: response.status, message: response.data.message })
        }
      });
    } else {
      const alert = document.getElementById('alert');
      alert.classList.remove('hidden');
      setAlert(Object.assign({}, { status: 400, message: 'チーム名を入力してください' }))
    }
  };

  const handleClickUpdate = (id, name) => {
    if (name.length) {
      axios
        .patch(`${gon.root_url}teams/${id}`, { team: { name }})
        .then((response) => {
          if (response.status === 200) {
            const newData = data.map((team) => team.id === response.data.team.id ? response.data.team : team);
            const alert = document.getElementById('alert');
            const editForm = document.getElementById(`edit-team-${response.data.team.id}`);
            setData(newData);
            alert.classList.remove('hidden');
            setAlert({ status: response.status, message: response.data.message });
            editForm.classList.add('hidden');
          } else {
            const alert = document.getElementById('alert');
            alert.classList.remove('hidden');
            setAlert({ status: response.status, message: response.data.message });
          }
        });
    } else {
      const alert = document.getElementById('alert');
      alert.classList.remove('hidden');
      setAlert(Object.assign({}, { status: 400, message: 'チーム名を入力してください' }));
    }
  }

  const handleClickDelete = (id) => {
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
            const alert = document.getElementById('alert');
            alert.classList.remove('hidden');
            setAlert(Object.assign({}, { status: 400, message: 'チーム名を入力してください' }));
          }
        });
    }
  };

  const handleClickCloseAlert = () => {
    const alert = document.getElementById('alert');
    alert.classList.add('hidden');
  }

  const handleClickToggleForm = (id) => {
    const editForm = document.getElementById(`edit-team-${id}`);
    editForm.className == 'hidden' ? editForm.classList.remove('hidden') :  editForm.classList.add('hidden');
  }

  return (
    <>
      <div className="my-2 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative hidden" role="alert" id='alert'>
        <span className="block sm:inline">{alert.message}</span>
        <button className="absolute top-0 bottom-0 right-0 px-4 py-3 focus:outline-none" onClick={() => handleClickCloseAlert()}>
          <svg className="fill-current h-6 w-6 text-red-500" role="button" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
            <title>Close</title>
            <path d="M14.348 14.849a1.2 1.2 0 0 1-1.697 0L10 11.819l-2.651 3.029a1.2 1.2 0 1 1-1.697-1.697l2.758-3.15-2.759-3.152a1.2 1.2 0 1 1 1.697-1.697L10 8.183l2.651-3.031a1.2 1.2 0 1 1 1.697 1.697l-2.758 3.152 2.758 3.15a1.2 1.2 0 0 1 0 1.698z"/>
          </svg>
        </button>
      </div>
      <article className='mt-2'>
        <label className='block w-full text-gray-700 text-xs font-bold'>
          チーム登録
        </label>
        <form className='flex justify-between w-full mt-1'>
          <input value={name} onChange={(e) => setName(e.target.value)} className='shadow border rounded block appearance-none text-gray-700 text-sm font-bold p-2 w-11/12 focus:shadow-outline focus:outline-none' placeholder='チーム名' />
          <button onClick={(e) => handleClickPost(e)} className='text-sm rounded bg-blue-500 text-white font-bold ml-2 py-2 px-4 hover:bg-blue-700 focus:outline-none focus:shadow-outline'>
            登録
          </button>
        </form>
      </article>
      <table className='table-fixed border-collapse w-full mt-6'>
        <thead>
          <tr className='bg-gray-300'>
            <th className='p-1 border text-sm w-11/12'>チーム名</th>
            <th className='p-1 border w-1/12' />
          </tr>
        </thead>
        <tbody>
          {data.map((team, i) => (
            <React.Fragment key={i}>
              <tr className='hover:bg-green-100' key={i}>
                <td className='border px-2 py-1'>{team.name}</td>
                <td className='border px-2 py-1'>
                  <span className='flex justify-around'>
                    <EditButton handleClick={handleClickToggleForm} id={team.id} />
                    {team.base ? '' : <TrashButton handleClick={handleClickDelete} id={team.id}/>}
                  </span>
                </td>
              </tr>
              <tr id={`edit-team-${team.id}`} className='hidden'>
                <td className='border' colSpan='2'>
                  <span className='flex'>
                    <Form teamId={team.id} name={team.name} handleClickUpdate={handleClickUpdate} />
                  </span>
                </td>
              </tr>
            </React.Fragment>
          ))}
        </tbody>
      </table>
    </>
  );
}

export default Table;
