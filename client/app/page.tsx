async function getProducts() {
  const res = await fetch('http://localhost:5005/products')
  if (!res.ok) {
    throw new Error('Failed to fetch data')
  }
  return res.json()
}

export default async function Home() {
  const items = await getProducts()

  return (
    <div>
      {items.map((item: any) => (
        <div key={item.product_id}>
          <p>Name {item.product_name}</p>
          <p>Price {item.product_price}</p>
        </div>
      ))}
    </div>
  )
}