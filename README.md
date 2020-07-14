# README

VIPER + storyboardの設定で作成

Github Trending APIを使ってRepositoryの一覧を表示-> TableViewをタップしたら遷移するというシンプルなアプリ

```bash
    ├──data
│   │   └── Interactor //通信部分の層
│   │       └── GetRepositoryInteractor.swift
│   ├── entity
│   │   └── Repository.swift
│   ├── generated // swiftgenで作成したstoryboard用のファイル
│   │   └── Scenes.swift
│   └── module
│       ├── RepositoryDetail
│       │   ├── Presenter // View Router Interactor などの中間点
│       │   │   └── RepositoryDetailPresenter.swift
│       │   ├── Router // 画面遷移など
│       │   │   └── RepositoryDetailRouter.swift
│       │   └── View // ViewControllerやstoryboard
│       │       ├── RepositoryDetail.storyboard
│       │       └── RepositoryDetailViewController.swift
│       ├── RepositoryList
│       │   ├── Presenter
│       │   │   └── RepositoryListPresenter.swift
│       │   ├── Router
│       │   │   └── RepositoryListRouter.swift
│       │   └── View
│       │       ├── RepositoryList.storyboard
│       │       ├── RepositoryListViewController.swift
│       │       └── SubView
│       │           ├── RepositoryTableViewCell.swift
│       │           └── RepositoryTableViewCell.xib
│       └── Root // 初期の画面遷移
│           └── RootRouter.swift

```

