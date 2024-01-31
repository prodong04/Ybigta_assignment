import './App.css';
import React, { useState } from 'react';

const Homework = () => {
  const [inputText, setInputText] = useState('');
  const [comments, setComments] = useState([
    { id: 1, username: 'bibigo', content: '안녕하세요' },
    { id: 2, username: 'bibigo', content: '교육세션 끝' },
    { id: 3, username: 'bibigo', content: '신입기수 프로젝트' },
  ]);

  const handleNewComment = () => {
    if (inputText.trim() !== '') {
      const newComment = {
        id: comments.length + 1,
        username: 'bibigo',
        content: inputText,
      };
      setComments([...comments, newComment]);
      setInputText('');
    }
  };

  return (
    <>
      <header>
        <img
          alt="logo"
          src="https://avatars.githubusercontent.com/u/16025679?s=200&v=4"
          height="64"
        />
        <p>YBIGTA 교육세션</p>
      </header>
      <div className="body">
        <div className="publish">
          <input
            type="text"
            value={inputText}
            onChange={(e) => setInputText(e.target.value)}
          />
          <button onClick={handleNewComment}>등록</button>
        </div>
        {comments.map((item) => (
          <div key={item.id} className="comments">
            <p>{item.content}</p>
          </div>
        ))}
      </div>
    </>
  );
};

export default Homework;
