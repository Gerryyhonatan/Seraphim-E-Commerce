import { CardImage } from "@/components/ProductCard"

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
        <CardImage product={item} key={item.product_id}></CardImage>
      ))}
    </div>
  )
}