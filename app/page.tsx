import Image from 'next/image'
import React from 'react'

async function Page(props: any) {
    // 在 props 中拿到数据

    return (
        <main className="flex min-h-screen flex-col p-2">
            <div className="flex h-20 shrink-0 items-end rounded-lg bg-blue-500 p-4 md:h-52"></div>
            <div className="mt-4">
                <div className="flex items-center justify-center">
                    <Image
                        src="/bird.jpg"
                        width={1440}
                        height={760}
                        alt="Screenshots of the dashboard project showing desktop and mobile versions"
                    />
                </div>
            </div>
        </main>
    )
}
export default Page
