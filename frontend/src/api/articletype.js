import {
    requestGetList
} from './request'

export function articleTypeList(params) {
    return requestGetList('/post/api/articletype/', params)
}