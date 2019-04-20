import {
    requestPost,
    requestGetDetail,
    requestGetList
} from './request'

export function articlePost(data) {
    return requestPost('/post/api/article/', data)
}

export function articleList(params) {
    return requestGetList('/post/api/article/', params)
}

export function articleDetail(id) {
    return requestGetDetail(`/post/api/article/`, id)
}