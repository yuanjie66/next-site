import Head from 'next/head'
import type { FC } from 'react'
import Link from 'next/link'
import { useTranslation } from 'react-i18next'

type Props = {
  heading: string
  title: string
}

export const LayoutHeader: FC = () => {

    const { t } = useTranslation("common")

    return (
        <div>
            {t('h1')}
        </div>
    )
}
