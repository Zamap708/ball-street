'use client'

import { useEffect } from 'react';

const CreateUser = () => {
  useEffect(() => {
    const createUser = async () => {
      const response = await fetch('/api/test', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
      });
      const data = await response.json();
      console.log(data);
    };

    createUser();
  }, []);

  return <div>Creating user with Prisma</div>;
};

export default CreateUser;
