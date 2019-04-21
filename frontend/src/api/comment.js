import {
    requestPost,
    requestGetList
} from './request'

export function commentPost(data) {
    return requestPost('/post/api/comment/', data)
}

export function commentList(params) {
    return requestGetList('/post/api/comment/', params)
}