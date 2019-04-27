import {
    requestPost,
    requestGetList,
    requestPatch
} from './request'

export function choiceteacherPost(data) {
    return requestPost('/tutor/api/choiceteacher/', data)
}

export function choiceteacherList(params) {
    return requestGetList('/tutor/api/choiceteacher/', params)
}

export function choiceteacherPatch(id, data) {
    return requestPatch('/tutor/api/choiceteacher/', id, data)
}