async function getData() {
  const res = await fetch('http://localhost:5005/health')
 
  if (!res.ok) {
    throw new Error('Failed to fetch data')
  }
 
  return res.json()
}

export default async function Home() {
  const data = await getData()
  return (
    `Backend status: ${data.status}`
  );
}
