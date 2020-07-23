import React, { useState } from 'react';
import axios from 'axios';

import EditButton from '../Button/Edit';
import TrashButton from '../Button/Trash';
import Form from './Form';
import SuccessAlert from '../Alert/Sucess';
import DangerAlert from '../Alert/Danger';

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
          const alert = document.getElementById('success-alert');
          alert.classList.remove('hidden');
          setAlert({ status: response.status, message: response.data.message })
        } else {
          const alert = document.getElementById('danger-alert');
          alert.classList.remove('hidden');
          setAlert({ status: response.status, message: response.data.message })
        }
      });
    } else {
      const alert = document.getElementById('danger-alert');
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
            const alert = document.getElementById('success-alert');
            const editForm = document.getElementById(`edit-team-${response.data.team.id}`);
            setData(newData);
            alert.classList.remove('hidden');
            setAlert({ status: response.status, message: response.data.message });
            editForm.classList.add('hidden');
          } else {
            const alert = document.getElementById('danger-alert');
            alert.classList.remove('hidden');
            setAlert({ status: response.status, message: response.data.message });
          }
        });
    } else {
      const alert = document.getElementById('danger-alert');
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
            const alert = document.getElementById('success-alert');
            alert.classList.remove('hidden');
            setAlert({ status: response.status, message: response.data.message });
          } else {
            const alert = document.getElementById('danger-alert');
            alert.classList.remove('hidden');
            setAlert(Object.assign({}, { status: 400, message: 'チーム名を入力してください' }));
          }
        });
    }
  };

  const handleClickToggleForm = (id) => {
    const editForm = document.getElementById(`edit-team-${id}`);
    editForm.className == 'hidden' ? editForm.classList.remove('hidden') :  editForm.classList.add('hidden');
  }

  return (
    <>
      <SuccessAlert message={alert.message} />
      <DangerAlert message={alert.message} />
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
