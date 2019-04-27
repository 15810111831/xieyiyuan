import {
    requestPost,
    requestGetList,
} from './request'

export function userCommentPost(data) {
    return requestPost('/users/api/usercomment/', data)
}

export function userCommentList(params) {
    return requestGetList('/users/api/usercomment/', params)
}