import React from 'react';
import clsx from 'clsx';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import styles from './index.module.css';
import HomepageFeatures from '../components/HomepageFeatures';
import HomepageGuide from '../components/HomepageGuide';

function HomepageHeader() {
  const { siteConfig } = useDocusaurusContext();
  return (
    <header className={clsx('hero hero--primary', styles.heroBanner)}>
      <div className="container">
        <h1 className="hero__title">{siteConfig.title}</h1>
        <p className="hero__subtitle">{siteConfig.tagline}</p>
        <div className={styles.buttons}>
          <Link className="button button--primary button--lg" to="/docs/Quickstart">
            Download
          </Link>
          <span>&nbsp; &nbsp;</span>
          <Link className="button button--info button--lg" to="https://try.enarx.dev">
            Try Enarx
          </Link>
        </div>
      </div>
    </header>
  );
}

export default function Home() {
  const { siteConfig } = useDocusaurusContext();
  return (
    <Layout title={`${siteConfig.title}`} description="Enarx: Confidential Computing with WebAssembly">
      <HomepageHeader />
      <main>
        <HomepageFeatures />
        <HomepageGuide />
      </main>
    </Layout>
  );
}
